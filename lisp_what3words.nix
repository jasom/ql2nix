
{ buildLispPackage, stdenv, fetchurl, lisp-project_what3words, 
   lisp_jsown, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_jsown lisp_drakma  ];
      inherit stdenv;
      systemName = "what3words";
      
      sourceProject = "${lisp-project_what3words}";
      patches = [];
      lisp_dependencies = "${lisp_jsown} ${lisp_drakma}";
      name = "lisp_what3words-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
