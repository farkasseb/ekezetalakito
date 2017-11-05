module Ekezetalakito
  class ClipboardHelper

    def self.pbcopy(text)
      IO.popen('pbcopy', 'w') { |f| f << text }
    end

    def self.pbpaste
      %x{pbpaste -Prefer txt}
    end

  end
end
