
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack-static-asset-middleware, 
   lisp_djula, lisp_trivial-mimes, lisp_local-time, lisp_cl-ppcre, lisp_ironclad, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_djula lisp_trivial-mimes lisp_local-time lisp_cl-ppcre lisp_ironclad lisp_alexandria  ];
      inherit stdenv;
      systemName = "clack-static-asset-djula-helpers";
      
      sourceProject = "${lisp-project_clack-static-asset-middleware}";
      patches = [];
      lisp_dependencies = "${lisp_djula} ${lisp_trivial-mimes} ${lisp_local-time} ${lisp_cl-ppcre} ${lisp_ironclad} ${lisp_alexandria}";
      name = "lisp_clack-static-asset-djula-helpers-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
