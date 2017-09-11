
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-apple-plist, 
   lisp_html-encode,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_html-encode  ];
      inherit stdenv;
      systemName = "cl-apple-plist";
      
      sourceProject = "${lisp-project_cl-apple-plist}";
      patches = [];
      lisp_dependencies = "${lisp_html-encode}";
      name = "lisp_cl-apple-plist-20111105-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
