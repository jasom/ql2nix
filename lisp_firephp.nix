
{ buildLispPackage, stdenv, fetchurl, lisp-project_firephp, 
   lisp_hunchentoot, lisp_cl-json,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot lisp_cl-json  ];
      inherit stdenv;
      systemName = "firephp";
      
      sourceProject = "${lisp-project_firephp}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot} ${lisp_cl-json}";
      name = "lisp_firephp-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
