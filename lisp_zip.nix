
{ buildLispPackage, stdenv, fetchurl, lisp-project_zip, 
   lisp_cl-fad, lisp_babel, lisp_trivial-gray-streams, lisp_salza2,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_babel lisp_trivial-gray-streams lisp_salza2  ];
      inherit stdenv;
      systemName = "zip";
      
      sourceProject = "${lisp-project_zip}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_babel} ${lisp_trivial-gray-streams} ${lisp_salza2}";
      name = "lisp_zip-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
