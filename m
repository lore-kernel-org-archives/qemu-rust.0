Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89646D2D8D4
	for <qemu-rust@archiver.kernel.org>; Tue, 27 Jan 2026 10:15:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vkg6u-00034J-KS; Tue, 27 Jan 2026 05:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vkg6q-0002yl-Pb
 for qemu-rust@nongnu.org; Tue, 27 Jan 2026 05:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vkg6o-0007Oh-Co
 for qemu-rust@nongnu.org; Tue, 27 Jan 2026 05:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769508938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sX+4voRz0h257AvS8I2TlRjQpjGKCKa2c0/YQN5XchI=;
 b=OC/ffUVie+RFDNIBcoSve2KIt5S1CEBrc5OhxPnzOwQbPvOYDXfzDAJ6jsl2FKkHtVO7lS
 gtrA+ygw4s54NhNlAtzxoox0kpEUxoUUcLtaLunW8ZS3uoNQ9Eiff91XsJcK8S/szBhMqf
 0m1S0718l4NLlzzr6XG9rtJlle+OOKU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-rZ8aauA1NFexx9_or1Rorw-1; Tue, 27 Jan 2026 05:15:36 -0500
X-MC-Unique: rZ8aauA1NFexx9_or1Rorw-1
X-Mimecast-MFC-AGG-ID: rZ8aauA1NFexx9_or1Rorw_1769508935
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4801d21c280so35972885e9.1
 for <qemu-rust@nongnu.org>; Tue, 27 Jan 2026 02:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769508935; x=1770113735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sX+4voRz0h257AvS8I2TlRjQpjGKCKa2c0/YQN5XchI=;
 b=eQedM2iEFNlx+77Cp/6UCxaNDvQQUyzGhWzwsYNgDvqJDe0peiWXI0vPJkfXEDR+ye
 oTs0vTgQLm7wM5o3Dgz89hSiiea+mWUCsHviuqEDApOExLvR393tHxTSTSBL6ip+VHUD
 0m+OFZpix2EqxBDBOYHTLOrd1uJq07hapUWLVyTuBC+2FlE1HLJbT5B7qpRFZrf/CmqU
 fvW7G0gr0kt8XPBvsCEPtxcn/E/j5k+mL8yFvlXLjvApK9clat2m/TPGTDxlgjXrJFCA
 tz8qVjn3B+d95KAUuGFbVX1wIkGl9i0Gf+43+WfjWqUxZGG2oiMqmrCDA7BOPusXZrgz
 21cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx6C+McslwLccNNkUDxozVXHZQFAQf4hSkHmymPFs37zyZACdInG05WziUOkhQJb3TfMHr0CcsdhA=@nongnu.org
X-Gm-Message-State: AOJu0YxL7a7yN8TSbvEQqlZYH2GtZLL6EOVskkwxQbj2hpF2AnjV4FY6
 cmHVeYUlH7FlTfwnmPx4OkdRarp2NxRYrUZdUsskEBEU5EdDAAtrAzyUr7bL8tCpOe3Fwub2Uu1
 tpU+6tHKdnCQPZJIataqBhw660HhjC0YW7ktiuoxLWI0GqWhRYzpyO5M=
X-Gm-Gg: AZuq6aJEnC9OlOYsNM6zO5w4PiQGu/yD9oBe3nYR8dq+0/f5Jaiw6YK/1df7ZoiqzZ5
 eqBsPLqerDCTTQLUgz5eH/E5/lFwK3URkzdPrazhocJeCCoZpz3upshKkcXwvVWp2j4C/0iP+TQ
 piDFTNngjOkSCB+DnNhTYbsmwNDkP+PcOkaGfA++eDeSU6sxPCGZB0qWDoHBVuTsox0M1DsHbOq
 zbRpk13rPF9NBoB7lyntslb+jqPjPlZ/HotIwcH9za/DYKRoBh1Ke2d8WRAD19Utu2RMTfIQ2ya
 VMrmdUKJYAh6CC+QUyStxDcJwcAgA/F8niOCyOI/5aucqh1LJKEakqbKhlvjhZN8nj31/lXJOYq
 FIXJbbxDK3ZxzdgczCHBZX54Kf1M1sBkOLlQpgaTXTMRBvJesD2TrNpF7fS6jtuz0UH95tmtXOY
 vYsCK/Y3Hft8QG3Q==
X-Received: by 2002:a05:600c:1992:b0:47f:f952:d207 with SMTP id
 5b1f17b1804b1-48069c487a1mr14951625e9.19.1769508934977; 
 Tue, 27 Jan 2026 02:15:34 -0800 (PST)
X-Received: by 2002:a05:600c:1992:b0:47f:f952:d207 with SMTP id
 5b1f17b1804b1-48069c487a1mr14951205e9.19.1769508934357; 
 Tue, 27 Jan 2026 02:15:34 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48068eb9397sm37242035e9.11.2026.01.27.02.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 02:15:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Martin Kletzander <mkletzan@redhat.com>
Subject: Rust in QEMU update, January 2026
Date: Tue, 27 Jan 2026 11:15:30 +0100
Message-ID: <20260127101531.369519-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0G3zF8E5PbAAQ6ESLJW4lxa8Ld1rmsqsgOfz9q3Bte0_1769508935
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Summary
'''''''

Achievements
  Further improved code structure; initial bindings for QAPI merged;
  IOMMU support complete in rust-vmm; Rust enabled in CI for more host
  operating systems; dtrace support

Ongoing work for 11.0
  Mostly work on the Meson side to finish Cargo integration

Future work
  QMP commands; GStreamer backend; enable by default?


Table of contents
'''''''''''''''''

* Status in QEMU 11.0
* Improvements and cleanups
* Other work in progress
* Next steps


Status in QEMU 11.0
'''''''''''''''''''

The project is still experimental but is taking a more definite shape.
Some new code is waiting for review, but most of the effort over the
last few months was in consolidating what we have.

The minimum supported Rust version is fixed at 1.83, supported on
all platforms except Debian bookworm mips64el.  In particular Ubuntu
LTS is now packaging the version of Rust that is required.  Together
with fixes to Meson bugs, which were released in version 1.10, all
targets can now enable Rust in CI.  Meson 1.10 also makes it possible
to use rustc to link emulator binaries, which makes the resulting
executable smaller and the build system a bit simpler.

Support for tracing with the ``dtrace`` crate is now available through
the ``probe`` crate.  For ``ust``, the plan is to deprecate it, though
no step in that direction has been taken.  UST is able to work with
probes placed by the ``dtrace`` backend.

With these improvements, there is already a practical benefit to writing
*new* devices in Rust, especially if you don't need other APIs than those
with bindings.  The build system boilerplate is still substantial
for the time being, but this is a temporary issue; in the meanwhile, the
existing pl011 and HPET devices provide a model that is easy to follow.

If any devices are contributed that are written in Rust and do not have
a C counterpart, it may be worth splitting "enable Rust" from "enable
all devices written in Rust".  This way, the C versions of the pl011
and HPET devices can remain available until all platforms have a new-enough
compiler version and no build system issues.


Improvements and cleanups
'''''''''''''''''''''''''

Migration support was improved to support thread-safe (non-BQL)
devices, and Zhao looked at how to make HPET BQL-free, as is the case
for the C version.  This work was stopped, at least temporarily, because
we found some deadlocks... and discovered that the C code is simply not
taking a required lock. :/  More work, not tied to adoption of Rust,
is needed to understand what help is needed from common code in order
to avoid deadlocks between the BQL and device-specific locks.

However, the same HPET device is already using these same migration
improvements to achieve compatibility with the C device's migration
format, despite very different organization of the code.

Version 10.2 split the Rust<->C bridges across multiple crates,
each linking to the corresponding C code; this is now extended to
bindgen-generated code.

As mentioned in the earlier updates, in parallel to QEMU work I'm
looking at improvements to Meson's support for Cargo and Rust.
The Meson language extensions are now finalized and were approved
by Meson's BDFL.  For more information:

- https://github.com/mesonbuild/meson/issues/14639 (specification)

- https://github.com/mesonbuild/meson/pull/15223 (implementation)

- https://gitlab.com/bonzini/libblkio/-/commit/b14230d59 (using it
  in libblkio)



Other work in progress
''''''''''''''''''''''

Marc-André tried using Rust to develop a GStreamer backend for the
audio subsystem.  His prototype is available at
https://lore.kernel.org/qemu-devel/20251201112309.4163921-25-marcandre.lureau@redhat.com/.

Martin Kletzander has started to look at using pin-init to replace the
unsafe implementation of instance_init.  It's notable that Rust itself
is considering several solutions to this problem, and tracking it as an
"experiment" (https://github.com/rust-lang/lang-team/issues/336).  The
two top contenders are

- init expressions (https://hackmd.io/@aliceryhl/BJutRcPblx), directly
  based on pin-init

- &out references (https://hackmd.io/awB-GOYJRlua9Cuc0a3G-Q)

Personally I'd put my vote on the latter, which has the advantage
of better lifetime tracking.  Anyway, this is very early and for now
we will have to use macros to emulate the native language support.

Kevin Wolf had posted some work on the block layer last year.
Improvements to the build system since then probably would simplify some
parts of it.

While there are no Rust summer of code projects planned this year, there
are still a few days left to propose them (the deadline is February 7th).

Next steps
''''''''''

``vm-memory`` integration
  Last year, Zhao looked into using the ``vm-memory`` crate in QEMU.
  Because of QEMU's support for IOMMUs, this required changes to the
  crate.  Hanna Czenczek's work on IOMMU support for rust-vmm was now
  released, and work on ``vm-memory`` integration can continue.

Improving Meson support for cross-compiling Rust
  Orthogonally to the Cargo work, I looked at adding Meson support
  for build-machine subprojects.  Right now, each subproject needs to
  declare whether it builds host- or build-machine targets.  The
  changes at https://github.com/mesonbuild/meson/pull/15404 allow
  a procedural macro crate, depending for example on itertools, to
  request that the dependency be built for the build machine.

Integration of QObject and QAPI with serde
  The first step is under review and is mostly ready.  Future work
  includes modular builds (splitting bindings across multiple
  source files or even crates, to reduce the cost of recompilation),
  support for QMP commands, and support for QOM properties.

I2C support
  This was posted on the list and is on its way towards being
  updated, posted and integrated in QEMU.  With it, a third device
  (a GPIO expander) was converted to Rust.


