
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_clack-v1-compat, lisp_myway, lisp_cl-emb, lisp_cl-project, lisp_do-urlencode,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack-v1-compat lisp_myway lisp_cl-emb lisp_cl-project lisp_do-urlencode  ];
      inherit stdenv;
      systemName = "caveman";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_clack-v1-compat} ${lisp_myway} ${lisp_cl-emb} ${lisp_cl-project} ${lisp_do-urlencode}";
      name = "lisp_caveman-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
