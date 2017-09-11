
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-markdown, 
   lisp_cl-markdown, lisp_lift, lisp_trivial-shell,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-markdown lisp_lift lisp_trivial-shell  ];
      inherit stdenv;
      systemName = "cl-markdown-test";
      
      sourceProject = "${lisp-project_cl-markdown}";
      patches = [];
      lisp_dependencies = "${lisp_cl-markdown} ${lisp_lift} ${lisp_trivial-shell}";
      name = "lisp_cl-markdown-test-20101006-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
