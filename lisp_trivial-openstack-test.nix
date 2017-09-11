
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-openstack, 
   lisp_fiveam, lisp_hunchentoot, lisp_local-time, lisp_st-json, lisp_trivial-openstack, lisp_uri-template,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_hunchentoot lisp_local-time lisp_st-json lisp_trivial-openstack lisp_uri-template  ];
      inherit stdenv;
      systemName = "trivial-openstack-test";
      
      sourceProject = "${lisp-project_trivial-openstack}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_hunchentoot} ${lisp_local-time} ${lisp_st-json} ${lisp_trivial-openstack} ${lisp_uri-template}";
      name = "lisp_trivial-openstack-test-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
