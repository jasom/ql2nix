
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-date-time-parser, 
   lisp_alexandria, lisp_anaphora, lisp_cl-ppcre, lisp_local-time, lisp_parse-float, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_cl-ppcre lisp_local-time lisp_parse-float lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-date-time-parser";
      
      sourceProject = "${lisp-project_cl-date-time-parser}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_cl-ppcre} ${lisp_local-time} ${lisp_parse-float} ${lisp_split-sequence}";
      name = "lisp_cl-date-time-parser-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
