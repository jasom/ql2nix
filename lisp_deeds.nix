
{ buildLispPackage, stdenv, fetchurl, lisp-project_deeds, 
   lisp_form-fiddle, lisp_lambda-fiddle, lisp_bordeaux-threads, lisp_closer-mop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_form-fiddle lisp_lambda-fiddle lisp_bordeaux-threads lisp_closer-mop  ];
      inherit stdenv;
      systemName = "deeds";
      
      sourceProject = "${lisp-project_deeds}";
      patches = [];
      lisp_dependencies = "${lisp_form-fiddle} ${lisp_lambda-fiddle} ${lisp_bordeaux-threads} ${lisp_closer-mop}";
      name = "lisp_deeds-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
