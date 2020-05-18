# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Jiq < Formula
  desc "jid on jq - interactive JSON query tool using jq expressions"
  homepage "https://github.com/fiatjaf/jiq"
  head "https://github.com/fiatjaf/jiq.git"
  url "https://github.com/fiatjaf/jiq.git",
      :tag      => "0.6.1",
      :revision => "b24f06fabb766059db624dd8bc41ef1ff4d208ad"

  depends_on "go" => :build
  depends_on "jq"

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/fiatjaf/jiq"
    dir.install buildpath.children - [buildpath/".brew_home"]

    cd dir do
      system "go", "get", "-d", "./..."
      system "go", "build", "-trimpath", "-o", bin/"jiq", "./cmd/jiq/jiq.go"
    end
  end

  test do
    # TODO: how do you test something interactive like this?
    system "true"
  end
end
