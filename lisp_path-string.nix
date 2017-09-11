
{ buildLispPackage, stdenv, fetchurl, lisp-project_path-string, 
   lisp_cl-ppcre, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_split-sequence  ];
      inherit stdenv;
      systemName = "path-string";
      
      sourceProject = "${lisp-project_path-string}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_split-sequence}";
      name = "lisp_path-string-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
