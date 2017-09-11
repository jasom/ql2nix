
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-html5-parser, 
   lisp_cl-ppcre, lisp_flexi-streams, lisp_string-case,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_flexi-streams lisp_string-case  ];
      inherit stdenv;
      systemName = "cl-html5-parser";
      
      sourceProject = "${lisp-project_cl-html5-parser}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_flexi-streams} ${lisp_string-case}";
      name = "lisp_cl-html5-parser-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
