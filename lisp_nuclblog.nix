
{ buildLispPackage, stdenv, fetchurl, lisp-project_nuclblog, 
   lisp_cl-markdown, lisp_hunchentoot-auth, lisp_cl-store, lisp_cl-who, lisp_hunchentoot,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-markdown lisp_hunchentoot-auth lisp_cl-store lisp_cl-who lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "nuclblog";
      
      sourceProject = "${lisp-project_nuclblog}";
      patches = [];
      lisp_dependencies = "${lisp_cl-markdown} ${lisp_hunchentoot-auth} ${lisp_cl-store} ${lisp_cl-who} ${lisp_hunchentoot}";
      name = "lisp_nuclblog-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
