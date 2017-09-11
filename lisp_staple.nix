
{ buildLispPackage, stdenv, fetchurl, lisp-project_staple, 
   lisp_3bmd, lisp_3bmd-ext-code-blocks, lisp_cl-ppcre, lisp_clip, lisp_closer-mop, lisp_documentation-utils, lisp_staple-package-recording, lisp_trivial-arguments,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_3bmd lisp_3bmd-ext-code-blocks lisp_cl-ppcre lisp_clip lisp_closer-mop lisp_documentation-utils lisp_staple-package-recording lisp_trivial-arguments  ];
      inherit stdenv;
      systemName = "staple";
      
      sourceProject = "${lisp-project_staple}";
      patches = [];
      lisp_dependencies = "${lisp_3bmd} ${lisp_3bmd-ext-code-blocks} ${lisp_cl-ppcre} ${lisp_clip} ${lisp_closer-mop} ${lisp_documentation-utils} ${lisp_staple-package-recording} ${lisp_trivial-arguments}";
      name = "lisp_staple-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
