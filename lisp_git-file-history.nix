
{ buildLispPackage, stdenv, fetchurl, lisp-project_git-file-history, 
   lisp_cl-ppcre, lisp_legit, lisp_local-time,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_legit lisp_local-time  ];
      inherit stdenv;
      systemName = "git-file-history";
      
      sourceProject = "${lisp-project_git-file-history}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_legit} ${lisp_local-time}";
      name = "lisp_git-file-history-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
