
{ buildLispPackage, stdenv, fetchurl, lisp-project_manifest, 
   lisp_alexandria, lisp_closer-mop, lisp_monkeylib-html, lisp_puri, lisp_split-sequence, lisp_toot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop lisp_monkeylib-html lisp_puri lisp_split-sequence lisp_toot  ];
      inherit stdenv;
      systemName = "manifest";
      
      sourceProject = "${lisp-project_manifest}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop} ${lisp_monkeylib-html} ${lisp_puri} ${lisp_split-sequence} ${lisp_toot}";
      name = "lisp_manifest-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
