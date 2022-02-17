module RegistersHelper
    def datacao(datetime)
        datetime.strftime('%e / %m / %Y')
    end
end
