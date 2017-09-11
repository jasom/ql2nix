
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-string-match, 
   lisp_alexandria, lisp_iterate, lisp_parse-float, lisp_proc-parse,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_iterate lisp_parse-float lisp_proc-parse  ];
      inherit stdenv;
      systemName = "simple-scanf";
      
      sourceProject = "${lisp-project_cl-string-match}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_iterate} ${lisp_parse-float} ${lisp_proc-parse}";
      name = "lisp_simple-scanf-20160421-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
