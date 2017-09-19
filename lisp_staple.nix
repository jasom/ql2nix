
{ buildLispPackage, stdenv, fetchurl, lisp-project_staple, 
   lisp_3bmd-ext-code-blocks, lisp_3bmd, lisp_trivial-arguments, lisp_cl-ppcre, lisp_closer-mop, lisp_clip,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_3bmd-ext-code-blocks lisp_3bmd lisp_trivial-arguments lisp_cl-ppcre lisp_closer-mop lisp_clip  ];
      inherit stdenv;
      systemName = "staple";
      
      sourceProject = "${lisp-project_staple}";
      patches = [];
      lisp_dependencies = "${lisp_3bmd-ext-code-blocks} ${lisp_3bmd} ${lisp_trivial-arguments} ${lisp_cl-ppcre} ${lisp_closer-mop} ${lisp_clip}";
      name = "lisp_staple-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
