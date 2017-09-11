
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-string-match, 
   lisp_alexandria, lisp_babel,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel  ];
      inherit stdenv;
      systemName = "ascii-strings";
      
      sourceProject = "${lisp-project_cl-string-match}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel}";
      name = "lisp_ascii-strings-20160421-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
