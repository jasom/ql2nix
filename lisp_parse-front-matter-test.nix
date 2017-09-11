
{ buildLispPackage, stdenv, fetchurl, lisp-project_parse-front-matter, 
   lisp_fiveam, lisp_parse-front-matter,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_parse-front-matter  ];
      inherit stdenv;
      systemName = "parse-front-matter-test";
      
      sourceProject = "${lisp-project_parse-front-matter}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_parse-front-matter}";
      name = "lisp_parse-front-matter-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
