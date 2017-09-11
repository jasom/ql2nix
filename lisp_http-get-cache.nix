
{ buildLispPackage, stdenv, fetchurl, lisp-project_http-get-cache, 
   lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma  ];
      inherit stdenv;
      systemName = "http-get-cache";
      
      sourceProject = "${lisp-project_http-get-cache}";
      patches = [];
      lisp_dependencies = "${lisp_drakma}";
      name = "lisp_http-get-cache-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
