
{ buildLispPackage, stdenv, fetchurl, lisp-project_oe-encode, 
   lisp_babel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel  ];
      inherit stdenv;
      systemName = "oe-encode";
      
      sourceProject = "${lisp-project_oe-encode}";
      patches = [];
      lisp_dependencies = "${lisp_babel}";
      name = "lisp_oe-encode-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
