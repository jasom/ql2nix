
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-html5-parser, 
   lisp_string-case, lisp_flexi-streams, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_string-case lisp_flexi-streams lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-html5-parser";
      
      sourceProject = "${lisp-project_cl-html5-parser}";
      patches = [];
      lisp_dependencies = "${lisp_string-case} ${lisp_flexi-streams} ${lisp_cl-ppcre}";
      name = "lisp_cl-html5-parser-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
