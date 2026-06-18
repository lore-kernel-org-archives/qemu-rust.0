Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AB0CD98F2
	for <qemu-rust@archiver.kernel.org>; Thu, 18 Jun 2026 20:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1waJcx-0007CG-4T; Thu, 18 Jun 2026 16:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waJcu-0007Ae-HL
 for qemu-rust@nongnu.org; Thu, 18 Jun 2026 16:46:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waJcs-00013d-OC
 for qemu-rust@nongnu.org; Thu, 18 Jun 2026 16:46:16 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65IKkDaH2913188
 for <qemu-rust@nongnu.org>; Thu, 18 Jun 2026 20:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DPqnVCoHQBGATnAtyDMuVQ6Ys2cDKQ4OwKSwyl7QuWw=; b=VFDIJ00dzSZXgKTq
 srQo7hRU2hFKEUjdVonUARfuKziuHh40POcnMjYYDMnj7995ql2kWStmofb3CrbR
 /Y/xh2f28aA9G+bPE9Yjjj5DG59mqDCULOpf0GjW/sjsGRMrZxUhhvWw0zwb7gVI
 gve5nNg+W1xoB6sebE6eGdihNloELVv37fvJMoO3f7fML4+WY+3iKzgrVfFqvQv3
 Cga+MbrMO2y8PyVNqVjcCcad9Zaa210F77Aeiunx9PA8iSZIScdXpJJj/V5Ujdya
 FMk09sc3XQY3kZBdd0LXF3RAfAiBqqZAIy2R3GWhPoebwOHfgQopEDYa87nnJJ8x
 vXVYKg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm2298jq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Thu, 18 Jun 2026 20:46:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-72745cb2c3dso1611182137.0
 for <qemu-rust@nongnu.org>; Thu, 18 Jun 2026 13:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781815572; x=1782420372; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DPqnVCoHQBGATnAtyDMuVQ6Ys2cDKQ4OwKSwyl7QuWw=;
 b=BqmLAb5RhCfn9IbTQJcQOavyXaIKiBpfYAaTfofSSgDHX80X/3r8J1Ib5JlPt32TEz
 o8P+/RE39FZX2yScpNHOBSTVcIsdAN+90DA2DhxK7+Zb48R3rYAYbbw+6KaRj2DnzDl8
 mnFRr/8OGt+r/UXL/w6j0Yl1e+u0RQR4i575PvTa0Q7610iAupiqfhy0L6YjzcPoQGKz
 h4UtrfkHPYLu8U5fa3CA9HklJOqrrNPXsMZe26pROxIu4qvz4PyEVnwxBDS8k5wI3C1N
 f90WpFE9PLe61TYv+CA9xEql9JftOgdmukQ344ktvQyCEAvmSh8tmO+DEmX5pvYILoQW
 vSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781815572; x=1782420372;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DPqnVCoHQBGATnAtyDMuVQ6Ys2cDKQ4OwKSwyl7QuWw=;
 b=s4a3DyUdOcII9TY3fdyxDp3iPVQCMBEPVugnUEu41s74MqU+zeGGO922ISvX1AVXGm
 Y9lzl2uYhZu2GIrROXSbvq480o6Z1S7J69+u7EdXSi6JU2yCGweJLWTf4tbifP4S8oEv
 dKgwrrQxahPg4z6Lxh2P6WihxInOA6XrJShOtusiyQeRvVBmAJ/uROEpG4frBZ27nMOS
 udGTOSd6royI4HK+A8xUki7z0q145bsDej9WXtFsl84zsq4RKO7TghmRkaT417NOmMs9
 HVnrhJqslhrA2C9zERFOvs1TwAnLALK2z4v8Ca8AS5/fwKtsjTMTiyDvw/r/DqQBLoTQ
 JmsQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GtLunKD2s0oB5WH1wkBEmab+hqq1NqPMBZ4uypWFtLZk6CRd/5xCp2UphUwxMKkTMJXHFnGd7vDI=@nongnu.org
X-Gm-Message-State: AOJu0Yx10d/26OGtgh7FORjq9uimBOLnDmYBQbcH7VSbfD9iIvi1Jv6p
 7Vmx/lcrIPOBgJscXqNFisq4gUbiwhqwqVyuvpwrD5utJlorgadUJ/BCaSfFhqdcXVRhoLlUS6n
 lJxYw+ve36nGC8eRTt+taBKORPVb0dD6O6Ys4mCG9Cu+SYNvJDkmfydUK
X-Gm-Gg: AfdE7ckop3FgTvKX5fz4GzZTTwgfnHf3gE9oB4hMIEU3pVdKibyuJLtccU7eVcKqasa
 6btK2qE+HnYKQW3S6NSUchSv2qj82o2B4KPQBn5mWVUpXTe51nwo21ijNmSP2g8+le4aMBW/fyT
 WSzXXJwYvfq8nFRkVXzIqykh3ubgHyTEPIRfCVJpgUjQMxOufyL6q4Fry2CZM9o2GPlV7r+r9xW
 o71ZtBwFtebQmlcejTjbnIUPEqJOhcEEIdcmkSEZrx3NeAC+P4cFLz2CxTKIUDIAU+qaYb6yM6o
 YCejRaK1psCb/0rinSKGdZdX5B838GHKSITWyaQYJPo0gg+GksTx4ugb+6Q9LQlZyU+0l60F/a6
 yeYml9LGvFM3YjKNZMJbq05DY70IAtx6BPBEDJ4lP82uqEJKQiz539e0Lb8Fzeg==
X-Received: by 2002:a05:6102:2910:b0:6da:1341:1147 with SMTP id
 ada2fe7eead31-72a1d20657cmr660272137.1.1781815572471; 
 Thu, 18 Jun 2026 13:46:12 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:6da:1341:1147 with SMTP id
 ada2fe7eead31-72a1d20657cmr660246137.1.1781815572033; 
 Thu, 18 Jun 2026 13:46:12 -0700 (PDT)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd1f886sm14231175e9.4.2026.06.18.13.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 13:46:11 -0700 (PDT)
Message-ID: <b7c8e3d6-aa2c-468a-9a78-0aee1c8b1e85@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] system/memory: move RamDiscardManager to
 separate compilation unit
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-rust@nongnu.org, Alex Williamson <alex@shazbot.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Fabiano Rosas <farosas@suse.de>, Mark Kanda <mark.kanda@oracle.com>,
 Ben Chaney <bchaney@akamai.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20260604-rdm5-v5-0-5768e6a0943d@redhat.com>
 <20260604-rdm5-v5-2-5768e6a0943d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260604-rdm5-v5-2-5768e6a0943d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a345915 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LzuOTfgjHi7GmFSmfN0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ouKpNiv-pZO_BsnFZrJanTxd55WOksm2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE5MCBTYWx0ZWRfX+aebuhjA2rX1
 Fo4iUGCueIDSIkxBKnLTWHihhh2Hx6q7jwxOUg2AA95JcAqc9DeQneegCD8ApD15SIh0RjSoDDB
 mTUFYk4dUE+opMmjx/SKQ/xxZOX7hyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE5MCBTYWx0ZWRfX3QcQQSlryxJN
 yl5vMIPqU0DXnFAPq/yJb3yf0TAD71axM592Wif1J5d6CiehxLgnlFDahm6hdpjAqoVHSkwh3fF
 eRc+A/sMLkQbSJuQcHO8koROa4M/enTXvQoawoZ6j/AwJrxqTNWpui9eMK1o8k3YC41YWz1TbUj
 gVuwu81PE0MAb2u7bIMWYzWOdAH17nhnjbV36Eb2H7TUVPvwFixIfzq1oVEynKW+Ax/0D3aTYZ3
 AmwuCaNXczqUehdv2CZn6wSQzf+kuPTYQIDjysCZSeVJY44+q1SEkXjclYY435zuyCkcw4Vse1O
 2IRot2Xrrh8d8f4tq0dvY66P2DR4UlYKUqAF/SfBn5k8nRceOYYPVruVic87W8Ewaz3gf96jfj4
 YCBuzUDtI6RGy5vy0Ri9G/lMiNEOsPJEmlCocHDiYvdnzariB3Tw6sOX6e+199qZRQ89asjNCkn
 QiSoXE4SW2Cf2Y0GqLQ==
X-Proofpoint-ORIG-GUID: ouKpNiv-pZO_BsnFZrJanTxd55WOksm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180190
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/6/26 15:43, Marc-AndrÃ© Lureau wrote:
> Extract RamDiscardManager and RamDiscardSource from system/memory.c into
> dedicated a unit.
> 
> This reduces coupling and allows code that only needs the
> RamDiscardManager interface to avoid pulling in all of memory.h
> dependencies.
> 
> rust-sys bindings are no longer generated for RamDiscardSourceClass at
> this point, thus we drop the unneeded InterfaceClass use.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Acked-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   MAINTAINERS                          |   2 +
>   include/system/memory.h              | 280 +--------------------------------
>   include/system/ram-discard-manager.h | 297 +++++++++++++++++++++++++++++++++++
>   system/memory.c                      | 221 --------------------------
>   system/ram-discard-manager.c         | 240 ++++++++++++++++++++++++++++
>   rust/bindings/system-sys/lib.rs      |   2 +-
>   system/meson.build                   |   1 +
>   7 files changed, 542 insertions(+), 501 deletions(-)


> diff --git a/include/system/ram-discard-manager.h b/include/system/ram-discard-manager.h
> new file mode 100644
> index 00000000000..da55658169f
> --- /dev/null
> +++ b/include/system/ram-discard-manager.h
> @@ -0,0 +1,297 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * RAM Discard Manager
> + *
> + * Copyright Red Hat, Inc. 2026
> + */
> +
> +#ifndef RAM_DISCARD_MANAGER_H
> +#define RAM_DISCARD_MANAGER_H
> +
> +#include "qemu/typedefs.h"

Not needed, already provided in sources by "qemu/osdep.h".

> +#include "qom/object.h"
> +#include "qemu/queue.h"
> +
> +#define TYPE_RAM_DISCARD_MANAGER "ram-discard-manager"
> +typedef struct RamDiscardManagerClass RamDiscardManagerClass;
> +typedef struct RamDiscardManager RamDiscardManager;
> +DECLARE_OBJ_CHECKERS(RamDiscardManager, RamDiscardManagerClass,
> +                     RAM_DISCARD_MANAGER, TYPE_RAM_DISCARD_MANAGER);
> +
> +#define TYPE_RAM_DISCARD_SOURCE "ram-discard-source"
> +typedef struct RamDiscardSourceClass RamDiscardSourceClass;
> +typedef struct RamDiscardSource RamDiscardSource;
> +DECLARE_OBJ_CHECKERS(RamDiscardSource, RamDiscardSourceClass,
> +                     RAM_DISCARD_SOURCE, TYPE_RAM_DISCARD_SOURCE);
> +
> +typedef struct RamDiscardListener RamDiscardListener;
> +typedef int (*NotifyRamPopulate)(RamDiscardListener *rdl,
> +                                 MemoryRegionSection *section);
> +typedef void (*NotifyRamDiscard)(RamDiscardListener *rdl,
> +                                 MemoryRegionSection *section);
> +
> +struct RamDiscardListener {
> +    /*
> +     * @notify_populate:
> +     *
> +     * Notification that previously discarded memory is about to get populated.
> +     * Listeners are able to object. If any listener objects, already
> +     * successfully notified listeners are notified about a discard again.
> +     *
> +     * @rdl: the #RamDiscardListener getting notified
> +     * @section: the #MemoryRegionSection to get populated. The section
> +     *           is aligned within the memory region to the minimum granularity
> +     *           unless it would exceed the registered section.
> +     *
> +     * Returns 0 on success. If the notification is rejected by the listener,
> +     * an error is returned.
> +     */
> +    NotifyRamPopulate notify_populate;
> +
> +    /*
> +     * @notify_discard:
> +     *
> +     * Notification that previously populated memory was discarded successfully
> +     * and listeners should drop all references to such memory and prevent
> +     * new population (e.g., unmap).
> +     *
> +     * @rdl: the #RamDiscardListener getting notified
> +     * @section: the #MemoryRegionSection to get discarded. The section
> +     *           is aligned within the memory region to the minimum granularity
> +     *           unless it would exceed the registered section.
> +     */
> +    NotifyRamDiscard notify_discard;
> +
> +    MemoryRegionSection *section;
> +    QLIST_ENTRY(RamDiscardListener) next;
> +};
> +
> +static inline void ram_discard_listener_init(RamDiscardListener *rdl,
> +                                             NotifyRamPopulate populate_fn,
> +                                             NotifyRamDiscard discard_fn)
> +{
> +    rdl->notify_populate = populate_fn;
> +    rdl->notify_discard = discard_fn;

Pre-existing, this initializer doesn't justify inlining in header.

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +}


