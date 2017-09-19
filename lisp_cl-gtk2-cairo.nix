
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gtk2, 
  pango, gnome2,   lisp_cl-cairo2, lisp_closer-mop, lisp_bordeaux-threads, lisp_iterate, lisp_trivial-garbage, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cairo2 lisp_closer-mop lisp_bordeaux-threads lisp_iterate lisp_trivial-garbage lisp_cffi pango gnome2.gtk ];
      inherit stdenv;
      systemName = "cl-gtk2-cairo";
      
      sourceProject = "${lisp-project_cl-gtk2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cairo2} ${lisp_closer-mop} ${lisp_bordeaux-threads} ${lisp_iterate} ${lisp_trivial-garbage} ${lisp_cffi}";
      name = "lisp_cl-gtk2-cairo-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
