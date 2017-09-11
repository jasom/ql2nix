
{ buildLispPackage, stdenv, fetchurl, lisp-project_firephp, 
   lisp_cl-json, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "firephp";
      
      sourceProject = "${lisp-project_firephp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_hunchentoot}";
      name = "lisp_firephp-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
