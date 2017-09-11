
{ buildLispPackage, stdenv, fetchurl, lisp-project_clx-xembed, 
   lisp_clx,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clx  ];
      inherit stdenv;
      systemName = "xembed";
      
      sourceProject = "${lisp-project_clx-xembed}";
      patches = [];
      lisp_dependencies = "${lisp_clx}";
      name = "lisp_xembed-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
