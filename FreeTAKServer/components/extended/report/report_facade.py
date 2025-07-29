from digitalpy.core.component_management.impl.default_facade import DefaultFacade

from FreeTAKServer.components.extended.report.controllers.report_general_controller import ReportGeneralController
#protectedstart imports ############################################################################
#protectedend ######################################################################################


#protectedstart classDeclaration ###################################################################
class ReportFacade(DefaultFacade):
#protectedend ######################################################################################

    """Facade class for the this component. Responsible for handling all public
    routing. Forwards all requests to the internal router.
    WHY:
    <ul>
    <li><b>Isolation</b>: We can easily isolate our code from the complexity of
    a subsystem.</li>
    <li><b>Testing Process</b>: Using Facade Method makes the process of testing
    comparatively easy since it has convenient methods for common testing tasks.
    </li>
    <li><b>Loose Coupling</b>: Availability of loose coupling between the
    clients and the Subsystems.</li>
    </ul>
    """
#protectedstart classComments#######################################################################
#protectedend ######################################################################################



#	default constructor  def __init__(self):
#protectedstart classVars ##########################################################################
#protectedend ######################################################################################


    def __init__(self, *args, **kwargs):
#protectedstart classVars ##########################################################################
#protectedend ######################################################################################

        self.edit_reports = ReportGeneralController(*args, **kwargs)
        self.view_reports = ReportGeneralController(*args, **kwargs)
        self.report_publish = ReportGeneralController(*args, **kwargs)
        self.manifest = {}

#protectedstart functions ##########################################################################
#protectedend ######################################################################################

# Alias so dynamic loader finds the expected class
Report = ReportFacade
