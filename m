Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F34CD98F2
	for <qemu-rust@archiver.kernel.org>; Thu, 18 Jun 2026 20:12:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1waJ5s-0003iw-6R; Thu, 18 Jun 2026 16:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1waJ5q-0003iM-EB
 for qemu-rust@nongnu.org; Thu, 18 Jun 2026 16:12:06 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1waJ5n-0004s0-MU
 for qemu-rust@nongnu.org; Thu, 18 Jun 2026 16:12:06 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-30beab3af9eso3659691eec.1
 for <qemu-rust@nongnu.org>; Thu, 18 Jun 2026 13:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781813521; cv=none;
 d=google.com; s=arc-20240605;
 b=Q4l3byV0abMFBR53HTu7lCVdUd96V+/VRvIVKwazwvlNjJvrYiSY14A1bNxmGo0NQ5
 /Fud8jrX4l21CpJpWsCjjqIg7VcsreRtVjbnEK0JLvakH0FoGu9UGrF/wgqR93z2oFnP
 27YYwxvO5Y0vcAOYT8Q0KW5g6W5yeD/mdfmfUGLDYmp9O7V7bS28xe466V9B44Rh2W1H
 L/DOe0BrxyoyLhXK9WItCAPN2jOJWcCwkIZ0PFLXCB86yZhLnQzyhBLwhNTlFbyfkp4F
 FOwAXaQPNHAQ0BLIXXOOSlFa4x+WsS/YVOu3oiK1TgUf31cBaWQVtxZiccN5c00mLy02
 r6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5kYopXboz5kqOzIBlpvq52lfuCitZ+UkaPqUgkNm8aw=;
 fh=xfAO1dG4hp4oYH4H+BctW3YMcwz2BdIWzE5nj4Jgdyk=;
 b=UFOy+TuxrgHYKK3+yGo+W/jZ8zyiUu8IECJT78Zx3U2ZB8HpnICn881QnUdyAnfj2z
 b72rzL0tLk1DFOUg79477IR5CEh4g/FJDZ7GVdILDndePrTpbdlaClNEA6VClFiMoJvq
 fRP7dBjgpW39br1RoxMG4WJQn4LB+sYr9m0pG1/PfDXHPUNlSVfta6QJ5iQuo/1gMi9M
 Ue5Ev3TI9TnJkeKNTtLqncxx1ZpY/Sdo3g1Qfvxeo/nZct1WMgvVBvwgHAOAKyWrlyyo
 EI22S1s652wQfbVbeTePFU1Lx79Z5VootodH+XSeoDVFqiF48Qvy0LFURTTEpRtabi/V
 IW1A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1781813521; x=1782418321; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kYopXboz5kqOzIBlpvq52lfuCitZ+UkaPqUgkNm8aw=;
 b=pMZ2Nw1fkjljCjRR+nVTd+6kmyfc9F0mPeLGff45IBOslO0WwMcDksVhh9bSBVNZGw
 qpj6SusduG/vZPJTrjUBfLoxTNa/mVHCis4R9PnHhncvMLvU39D0MLugslD542lXa2r/
 o/18k9mZdO2HpVRreJrEZPFIuQuutyVuYIsrcQZ+lHvLm9jvLnIOzjctOQX9MOdevq4O
 TWWaFE6OYpM2Zjl1n6A1NphMqwIK1FPB9cuaDBCcmzHYYh4G+2+bIfg1Xi3Jl3uVNmtr
 y/33X3euPLD6vAoJ4Na4NFtpnnXlEEJZrhny3npMVk/TWIrfJDLuGzST9GeR2lX2MbbC
 Anvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781813521; x=1782418321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5kYopXboz5kqOzIBlpvq52lfuCitZ+UkaPqUgkNm8aw=;
 b=emv3UruO3skmSDVIXfUYJFoNedaSZNnlGlaRajysJ56aW+WrYJOCliZbQaH5MEPLi+
 3sliE7BZ6a7p8BAttN9NFqwCUc6M2V0a5FlBKp3QoV22yKa8Bz/EU61TRz8Uz+/oaq15
 OrLW4NkRQOxyywbBAF5K0KlIZ6aKxWiXA994lQTPFJQNsVxusqp3FzpTIsYQAjMfbdSZ
 iLEzVc1EjjIQJ6j9Y5Flx+JShqGkzN4IMyHspKFsPEGfhAQecCq1ucRlacm9Op1TZZnx
 AF/AfAwOW9Dg9OjOzQ/7wAW8RXxVOWOzktxpnSxDi/Kj3DPM1n6byFgOF1PAWD6dcHHQ
 OFBQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/1/FDGXY6WLgiNy3jjXiZbyaCG0pdvjB222jVPCfThjlAU0PtmUM0eveWkH9tQrQhrZjRiAuPJluw=@nongnu.org
X-Gm-Message-State: AOJu0YzmvGDi5+h1SSbzV6yv7B+Qa24FfzPWzm11/UqI8qJXrTGaMLIV
 +o1dq5tsbIVpGZ4YdItqTNiCbA7N1XCttuvrMhMOnBu1SrtmmGXkJfeHg4wep8he5LSmFhwk1At
 zfqi6qQZd8JPPs4lef8054DQYxiW1RWY=
X-Gm-Gg: AfdE7clASpAkndhV0agcZp4S1KT0+ouhlGSN3Mwj44zsrX++I7P+vr8d+qdHrS/pjT6
 W76yumGzNW0kygFcqAe+IIPtWG/aqvbHTNShyruoQnLo/mUYyQszTArVTM0O7oRaQfdkI9ULkHY
 Wkb9GrkaD/QWjIg8K8LW0SBWHHFI3TSnMq7mg6QRZL15RFH80+1pt506V1wYwoITbWhOUfW2N64
 cGu6baWb3lHlfiPnbJIRigmL88RxcdEHZzKZMDoZ41dzvQ1TXblJqgwi7pQT4/enXHCemy+wc/X
 LgEQHFvoj1ovqA36Igu/MhbWAwjE
X-Received: by 2002:a05:7301:678c:b0:304:2176:a871 with SMTP id
 5a478bee46e88-30c06bfca99mr761091eec.0.1781813520818; Thu, 18 Jun 2026
 13:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260604-rdm5-v5-0-5768e6a0943d@redhat.com>
In-Reply-To: <20260604-rdm5-v5-0-5768e6a0943d@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 19 Jun 2026 00:11:48 +0400
X-Gm-Features: AVVi8CegESbR6ZUD8SxLZ5ge_fQXIzH6szCQH4muF2WdxFR38w89t5-t2aW9E34
Message-ID: <CAJ+F1CKRvSWDOvKC98e_7uyjgJMuXfhOHP83H0s7a=+ZrYxA1g@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Make RamDiscardManager work with multiple
 sources & virtio-mem
To: qemu-devel@nongnu.org
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 David Hildenbrand <david@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 qemu-rust@nongnu.org, Alex Williamson <alex@shazbot.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Mark Kanda <mark.kanda@oracle.com>, Ben Chaney <bchaney@akamai.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x132b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi

On Thu, Jun 4, 2026 at 5:46=E2=80=AFPM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi,
>
> This is an attempt to fix the incompatibility of virtio-mem with confiden=
tial
> VMs. The solution implements what was discussed earlier with D. Hildenbra=
nd:
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20250407074939.1865=
7-5-chenyi.qiang@intel.com/#3502238
>
> The first patches are misc cleanups. Then some code refactoring to have s=
plit a
> manager/source. And finally, the manager learns to deal with multiple sou=
rces.
>
> This has been tested together with the Linux kernel series from
> Zhenzhong Duan [1] for TDX guests.
>
> (help fix https://issues.redhat.com/browse/RHEL-131968)

Can the patch 1-11 be queued or are we missing something?
(RFC patch 12 can be dropped for now)

thanks

>
> v5:
> - explain why InterfaceClass in rust binding is not needed after
>   moving RamDiscardSource
> - drop extraneous added blank line
> - replaced a runtime "if (has_rdm)"" with an assert()
> - dropped "RFC: hw/virtio: start virtio-mem guest_memfd regions as
>   shared", in favour of start-private memory approach from "[RFC PATCH
>   0/6] Support virtio-mem memory hotplug in TDX guests" [1]
> - demote "monitor: add 'info ramblock-attributes'" as RFC
> - rebased and collected trailers
>
> v4:
>  - added "system/physmem: make ram_block_discard_range() handle guest_mem=
fd"
>  - added "monitor: add 'info ramblock-attributes' command"
>  - added "RFC: hw/virtio: start virtio-mem guest_memfd regions as shared"
>  - skip calling source in notify_populate (it may not have updated its
>    internal state)
>  - rebased, collected trailer tags
>
> v3: issues found by C=C3=A9dric
>  - fix assertion error on shutdown, due to rcu-defer cleanup
>  - fix API doc warnings
>
> v2:
>  - drop replay_{populated,discarded} from source, suggested by Peter Xu
>  - add extra manager cleanup
>  - add r-b tags for preliminary patches
>
> - Link to v4: https://lore.kernel.org/qemu-devel/20260504-rdm5-v4-0-bdf61=
e57c1e1@redhat.com
>
> [1]: https://lore.kernel.org/lkml/20260604093551.1511079-1-zhenzhong.duan=
@intel.com/
>
> ---
> Marc-Andr=C3=A9 Lureau (12):
>       system/memory: split RamDiscardManager into source and manager
>       system/memory: move RamDiscardManager to separate compilation unit
>       system/memory: constify section arguments
>       system/ram-discard-manager: implement replay via is_populated itera=
tion
>       virtio-mem: remove replay_populated/replay_discarded implementation
>       system/ram-discard-manager: drop replay from source interface
>       system/memory: implement RamDiscardManager multi-source aggregation
>       system/physmem: destroy ram block attributes before RCU-deferred re=
claim
>       system/memory: add RamDiscardManager reference counting and cleanup
>       tests: add unit tests for RamDiscardManager multi-source aggregatio=
n
>       system/physmem: make ram_block_discard_range() handle guest_memfd
>       RFC: monitor: add 'info ramblock-attributes' command
>
>  MAINTAINERS                                 |    4 +
>  qapi/machine.json                           |   56 ++
>  include/hw/vfio/vfio-container.h            |    2 +-
>  include/hw/vfio/vfio-cpr.h                  |    2 +-
>  include/hw/virtio/virtio-mem.h              |    3 -
>  include/monitor/hmp.h                       |    1 +
>  include/system/memory.h                     |  279 +-----
>  include/system/ram-discard-manager.h        |  358 ++++++++
>  include/system/ramblock.h                   |    5 +-
>  accel/kvm/kvm-all.c                         |    2 +-
>  hw/core/machine-hmp-cmds.c                  |   32 +
>  hw/vfio/cpr-legacy.c                        |    4 +-
>  hw/vfio/listener.c                          |   10 +-
>  hw/virtio/virtio-mem.c                      |  259 +-----
>  migration/ram.c                             |    6 +-
>  system/memory.c                             |   88 +-
>  system/memory_mapping.c                     |    4 +-
>  system/physmem.c                            |   27 +-
>  system/ram-block-attributes.c               |  328 +++----
>  system/ram-discard-manager.c                |  612 +++++++++++++
>  target/i386/kvm/tdx.c                       |    2 +-
>  tests/unit/test-ram-discard-manager-stubs.c |   48 ++
>  tests/unit/test-ram-discard-manager.c       | 1235 +++++++++++++++++++++=
++++++
>  hmp-commands-info.hx                        |   13 +
>  rust/bindings/system-sys/lib.rs             |    2 +-
>  system/meson.build                          |    1 +
>  system/trace-events                         |    2 +-
>  tests/unit/meson.build                      |    8 +-
>  28 files changed, 2569 insertions(+), 824 deletions(-)
> ---
> base-commit: 405c32d2b18a683ba36301351af75125d9afda08
> change-id: 20260414-rdm5-b6df2366d603
>
> Best regards,
> --
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>

