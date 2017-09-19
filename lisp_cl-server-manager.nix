
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-server-manager, 
   lisp_prepl, lisp_hunchentoot, lisp_swank, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prepl lisp_hunchentoot lisp_swank lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-server-manager";
      
      sourceProject = "${lisp-project_cl-server-manager}";
      patches = [];
      lisp_dependencies = "${lisp_prepl} ${lisp_hunchentoot} ${lisp_swank} ${lisp_alexandria}";
      name = "lisp_cl-server-manager-20131003-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
