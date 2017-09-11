
{ buildLispPackage, stdenv, fetchurl, lisp-project_path-parse, 
   lisp_fiveam, lisp_path-parse,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_path-parse  ];
      inherit stdenv;
      systemName = "path-parse-test";
      
      sourceProject = "${lisp-project_path-parse}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_path-parse}";
      name = "lisp_path-parse-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
