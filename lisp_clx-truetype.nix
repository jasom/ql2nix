
{ buildLispPackage, stdenv, fetchurl, lisp-project_clx-truetype, 
   lisp_trivial-features, lisp_cl-store, lisp_cl-fad, lisp_cl-vectors, lisp_zpb-ttf, lisp_clx,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-features lisp_cl-store lisp_cl-fad lisp_cl-vectors lisp_zpb-ttf lisp_clx  ];
      inherit stdenv;
      systemName = "clx-truetype";
      
      sourceProject = "${lisp-project_clx-truetype}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-features} ${lisp_cl-store} ${lisp_cl-fad} ${lisp_cl-vectors} ${lisp_zpb-ttf} ${lisp_clx}";
      name = "lisp_clx-truetype-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
