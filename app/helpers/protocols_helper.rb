module ProtocolsHelper
  def kind_of_protocol(status)
    if status == "template"
      return "テンプレートプロトコル"
    elsif status == "base"
      return "ベースプロトコル"
    elsif status == "custom"
      return "カスタムプロトコル"
    end
  end
end
