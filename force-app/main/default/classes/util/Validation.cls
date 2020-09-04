public class Validation {
    public Validation() {

    }

    public static string validateObjectCreateRequest(CreateObjectData data){
        string errors='';
        if(data.PartNameList.isEmpty())
        {
            errors=(string.isBlank(errors)?'':errors+',')+'PartNameList is empty, cannot creare Object';
        }
        
        if(data.PartMaterialNumberList.isEmpty())
        {
            errors=(string.isBlank(errors)?'':errors+',')+'PartMaterialNumberList is empty, cannot creare Object';
        }

        if(data.PartSupplierList.isEmpty())
        {
            errors=(string.isBlank(errors)?'':errors+',')+'PartSupplierList is empty, cannot creare Object';
        }

        if(data.PartSupplierPartNumberList.isEmpty())
        {
            errors=(string.isBlank(errors)?'':errors+',')+'PartSupplierPartNumberList is empty, cannot creare Object';
        }

        if(String.isBlank(data.APIname))
        {
            errors=(string.isBlank(errors)?'':errors+',')+'APIname is empty, cannot creare Object';
        }

        if(String.isBlank(data.Name))
        {
            errors=(string.isBlank(errors)?'':errors+',')+'Name is empty, cannot creare Object';
        }

        return errors;
    }
}
