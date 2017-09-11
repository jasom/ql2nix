
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump-tex, 
   lisp_cl-ppcre, lisp_plump,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_plump  ];
      inherit stdenv;
      systemName = "plump-tex";
      
      sourceProject = "${lisp-project_plump-tex}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_plump}";
      name = "lisp_plump-tex-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
