
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack-static-asset-middleware, 
   lisp_alexandria, lisp_cl-ppcre, lisp_ironclad, lisp_local-time, lisp_trivial-mimes,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_ironclad lisp_local-time lisp_trivial-mimes  ];
      inherit stdenv;
      systemName = "clack-static-asset-middleware";
      
      sourceProject = "${lisp-project_clack-static-asset-middleware}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_ironclad} ${lisp_local-time} ${lisp_trivial-mimes}";
      name = "lisp_clack-static-asset-middleware-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
