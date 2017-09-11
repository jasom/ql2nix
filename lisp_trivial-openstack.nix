
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-openstack, 
   lisp_alexandria, lisp_drakma, lisp_local-time, lisp_st-json,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_drakma lisp_local-time lisp_st-json  ];
      inherit stdenv;
      systemName = "trivial-openstack";
      
      sourceProject = "${lisp-project_trivial-openstack}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_drakma} ${lisp_local-time} ${lisp_st-json}";
      name = "lisp_trivial-openstack-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
