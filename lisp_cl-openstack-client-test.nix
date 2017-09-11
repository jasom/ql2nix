
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-openstack-client, 
   lisp_chunga, lisp_cl-openstack-client, lisp_cl-ppcre, lisp_drakma, lisp_fiveam, lisp_flexi-streams, lisp_local-time, lisp_trivial-gray-streams,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_chunga lisp_cl-openstack-client lisp_cl-ppcre lisp_drakma lisp_fiveam lisp_flexi-streams lisp_local-time lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "cl-openstack-client-test";
      
      sourceProject = "${lisp-project_cl-openstack-client}";
      patches = [];
      lisp_dependencies = "${lisp_chunga} ${lisp_cl-openstack-client} ${lisp_cl-ppcre} ${lisp_drakma} ${lisp_fiveam} ${lisp_flexi-streams} ${lisp_local-time} ${lisp_trivial-gray-streams}";
      name = "lisp_cl-openstack-client-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
