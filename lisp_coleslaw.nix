
{ buildLispPackage, stdenv, fetchurl, lisp-project_coleslaw, 
   lisp_cl-unicode, lisp_cl-ppcre, lisp_inferior-shell, lisp_local-time, lisp_3bmd-ext-code-blocks, lisp_3bmd, lisp_closure-template,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-unicode lisp_cl-ppcre lisp_inferior-shell lisp_local-time lisp_3bmd-ext-code-blocks lisp_3bmd lisp_closure-template  ];
      inherit stdenv;
      systemName = "coleslaw";
      
      sourceProject = "${lisp-project_coleslaw}";
      patches = [];
      lisp_dependencies = "${lisp_cl-unicode} ${lisp_cl-ppcre} ${lisp_inferior-shell} ${lisp_local-time} ${lisp_3bmd-ext-code-blocks} ${lisp_3bmd} ${lisp_closure-template}";
      name = "lisp_coleslaw-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
