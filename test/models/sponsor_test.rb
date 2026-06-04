require "test_helper"

class SponsorTest < ActiveSupport::TestCase
  setup do
    @sponsor_permanent = sponsors(:permanent)
  end

  test "Current sponsor includes permanent" do
    assert Sponsor.current.include?(@sponsor_permanent)
  end

  # Search tests using Ransack

  test "searches sponsors by name (case-insensitive)" do
    results = Sponsor.ransack(name_cont: "scalingo").result
    assert results.include?(sponsors(:permanent))
  end

  test "search returns empty for non-matching name" do
    results = Sponsor.ransack(name_cont: "nonexistent").result
    assert_empty results
  end

  test "search is case-insensitive" do
    results_upper = Sponsor.ransack(name_cont: "KARD").result
    results_lower = Sponsor.ransack(name_cont: "kard").result
    assert results_upper.include?(sponsors(:one))
    assert results_lower.include?(sponsors(:one))
  end

  test "search with partial match" do
    results = Sponsor.ransack(name_cont: "app").result
    assert results.any? { |s| s.name.downcase.include?("appaloosa") }
  end

  test "search with name_startsWith" do
    results = Sponsor.ransack(name_startsWith: "Google").result
    assert results.any? { |s| s.name == "Google" }
  end

  test "search with name_endsWith" do
    results = Sponsor.ransack(name_endsWith: "academy").result
    assert results.any? { |s| s.name.downcase.include?("academy") }
  end

  test "blank search returns all sponsors" do
    results = Sponsor.ransack(name_cont: "").result
    assert_equal Sponsor.all.size, results.size
  end

  test "search with m: 'or' for multiple conditions" do
    r = Sponsor.ransack(name_cont: "test", name_startsWith: "foo", m: "or")
    assert_kind_of ActiveRecord::Relation, r.result
  end

  # Ransackable attributes tests

  test "allows search on name" do
    assert_includes Sponsor.ransackable_attributes, "name"
  end

  test "does not allow search on other attributes" do
    ransackable = Sponsor.ransackable_attributes
    refute_includes ransackable, "website"
    refute_includes ransackable, "from"
    refute_includes ransackable, "until"
  end
end
