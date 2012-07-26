require "green_shoes"

require 'win32/sound'
include Win32


def boya dosya
  isim = Dir.glob("**/" + dosya.to_s  + "_*.png")[0]
  @imge.path = isim
  @ismi.text = isim.gsub(".png", "")
  Sound.play  @ismi.text + ".wav"
  #linux
  # v = video @ismi.text + ".mp3"
  # v.play
end

def sor
  dosya = rand(29)+1
  isim = Dir.glob("**/" + dosya.to_s  + "_*.png")[0]
  @imge2.path = isim
  @ismi2.text = ""
  isim.gsub(".png", "")
end

def cevapla dosya
  p dosya
  @ismi2.text = dosya
  Sound.play  @ismi2.text + ".wav"
  @ismi2.text = dosya
end


Shoes.app do
  @dosya = 1
  @dosya2 = ""
  flow do
    @imge = image("1_aleph.png")
    @ismi = para "1_aleph.png"
  end
  
  flow do
    button "önceki" do
      @dosya -= 1 if @dosya > 1
      boya @dosya
    end
    button "sonraki" do
      @dosya += 1 if @dosya < 29  
      boya @dosya
    end
  end

  flow(margin: 5) do 
    @imge2 = image("1_aleph.png")
    @ismi2 = para "1_aleph.png"
  end
  
  flow do
    button("sor", margin: 10) do
      @dosya2 = sor
    end
    button("cevapla", margin: 10) do
      p @dosya2
      cevapla @dosya2
    end
  end
    

  boya @dosya
end