
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-markdown, 
   lisp_cl-html-diff, lisp_cl-markdown, lisp_html-encode, lisp_lift, lisp_lml2, lisp_trivial-shell,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-html-diff lisp_cl-markdown lisp_html-encode lisp_lift lisp_lml2 lisp_trivial-shell  ];
      inherit stdenv;
      systemName = "cl-markdown-comparisons";
      
      sourceProject = "${lisp-project_cl-markdown}";
      patches = [];
      lisp_dependencies = "${lisp_cl-html-diff} ${lisp_cl-markdown} ${lisp_html-encode} ${lisp_lift} ${lisp_lml2} ${lisp_trivial-shell}";
      name = "lisp_cl-markdown-comparisons-20101006-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
