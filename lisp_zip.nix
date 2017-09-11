
{ buildLispPackage, stdenv, fetchurl, lisp-project_zip, 
   lisp_babel, lisp_cl-fad, lisp_salza2, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-fad lisp_salza2 lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "zip";
      
      sourceProject = "${lisp-project_zip}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-fad} ${lisp_salza2} ${lisp_trivial-gray-streams}";
      name = "lisp_zip-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
