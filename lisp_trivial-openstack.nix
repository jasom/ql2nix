
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-openstack, 
   lisp_local-time, lisp_st-json, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_st-json lisp_drakma  ];
      inherit stdenv;
      systemName = "trivial-openstack";
      
      sourceProject = "${lisp-project_trivial-openstack}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_st-json} ${lisp_drakma}";
      name = "lisp_trivial-openstack-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
