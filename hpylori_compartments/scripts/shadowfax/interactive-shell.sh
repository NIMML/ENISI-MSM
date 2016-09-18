##
## Example interactive qsub commands for the shadowfax cluster sfx_q
##

# Example requesting an interacive shell for one hour:
#qsub -I -W group_list=miep -q miep_q -l walltime=1:00:00 -l nodes=1

# Same example, but requesting multiple processors (this is uncommon):
qsub -I -W group_list=miep -q miep_q -l walltime=4:00:00 -l nodes=4:ppn=12

# Example requesting an interacive shell with X11 forwarding enabled:
# NOTE: Your DISPLAY must be set for this command to succeed
#qsub -I -W group_list=miep -q miep_q -l walltime=1:00:00 -l nodes=1 -X
