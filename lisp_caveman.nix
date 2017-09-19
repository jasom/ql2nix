
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_do-urlencode, lisp_cl-project, lisp_cl-emb, lisp_myway, lisp_clack-v1-compat,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_do-urlencode lisp_cl-project lisp_cl-emb lisp_myway lisp_clack-v1-compat  ];
      inherit stdenv;
      systemName = "caveman";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_do-urlencode} ${lisp_cl-project} ${lisp_cl-emb} ${lisp_myway} ${lisp_clack-v1-compat}";
      name = "lisp_caveman-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
