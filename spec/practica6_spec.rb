RSpec.describe Practica6 do

  context "Practica 10" do
    before(:each) do

    end

    context "Domain Specific Language - DSL" do
      it "El DSL funciona correctamente" do
        plato = Plato.new("Hamburguesa") do
          nombre    "Hamburguesa especial de la casa"
          alimento  :descripcion => "carne de vaca",
                    :gramos => 100
          alimento  :descripcion => "huevo",
                    :gramos => 20
        end

        menu = Menu.new("Combinado no. 1") do
          descripcion "hamburguesa, papas, refresco"
          componente :descripcion => "Hamburguesa especial de la casa",
                     :precio => 4.25
          componente :descripcion => "Papas pequenas",
                     :precio => 1.75
          componente :descripcion => "Refrescos de lata",
                     :precio => 1.50
          precio      7.50
        end

        expect(menu.preciofinal).to eq(7.50)

      end

    end

  end

end
