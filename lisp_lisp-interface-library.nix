
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-interface-library, 
   lisp_lil,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lil  ];
      inherit stdenv;
      systemName = "lisp-interface-library";
      
      sourceProject = "${lisp-project_lisp-interface-library}";
      patches = [];
      lisp_dependencies = "${lisp_lil}";
      name = "lisp_lisp-interface-library-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
