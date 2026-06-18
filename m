Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A855CD98ED
	for <qemu-rust@archiver.kernel.org>; Thu, 18 Jun 2026 20:52:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1waJiB-0008LG-L1; Thu, 18 Jun 2026 16:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waJi9-0008L0-JK
 for qemu-rust@nongnu.org; Thu, 18 Jun 2026 16:51:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waJi7-0002qA-U6
 for qemu-rust@nongnu.org; Thu, 18 Jun 2026 16:51:41 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65IIgmMr2558871
 for <qemu-rust@nongnu.org>; Thu, 18 Jun 2026 20:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ptbe4y4AW6tVSqoarkNqu6Ie+8WvPfZMWpNg1/yxZYs=; b=PX/hsXZ6W8vybzjW
 wjDZXz0774zSZvPwCe/WVSYLoaaSyjHKmpTLM077UYKgdv0o/SOL/t3/ptEOyJt1
 ZfYYBUBKtkCgoxYB1eF3aqHqLOuJjmO3aDtNquE89xjLSbTd34GgbUKM+vGWDG0M
 ActYN0wMbLUNzvZOmkz6rgOL44zRb5FaPOwsp8iuCdCt3qASxALSV8pKwTTzTyO+
 9L8wonmwPSDJLjTUb9s/jNrkF+do6PvdqMDI1K/XKQHSWVvQePgV48L6PfanF7XK
 6lHBRwO1h2Ck+zLOZqTfkNGxRcWTfKDQU3lRkPgiC2JrnHsfcDpp3FwdVoqbQfsn
 PWTyuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6s8m9u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-rust@nongnu.org>; Thu, 18 Jun 2026 20:51:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9157c8eb597so232149885a.2
 for <qemu-rust@nongnu.org>; Thu, 18 Jun 2026 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781815897; x=1782420697; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ptbe4y4AW6tVSqoarkNqu6Ie+8WvPfZMWpNg1/yxZYs=;
 b=eb6KvxjNlH+fAeRfAVgPhczfq9gCEPDu+qxOVSQvMZFGQwv1jlt89fw5BI0qRIz3LQ
 gjJQIENyxU8fJorJ7PHzdwQxtFRn1SHV9Z0FxOgUojVvj9AtmyZjqZ9v6nK6hWv/KonF
 pgV/lTYhQPlYxpCFZ2zE94jeMYoDcRXioK6URXi0uimdDumGNSGym5HuhrXSRhB+efDP
 wPLqIbLh2W3F4iYnTSjvvNH+WPiBsPf0tw2IbxSO8bg1i7rpE+2ZKz4xd4JZwTSApuul
 RTmsrFFngsUGuHr9MOLpbvqbhHKEW3l6FafNIPmJm3MGyD307twxLrUg4f4+ppEPr0Tk
 mdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781815897; x=1782420697;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ptbe4y4AW6tVSqoarkNqu6Ie+8WvPfZMWpNg1/yxZYs=;
 b=Lw03dkQ2wokQTibbbGLC8+o6D2VV0jvAO3I96CFZVvtTjWEf3eiWFXyVQS6/arHIf8
 TVTe8ed9keYXn5mEw0YGcQ1kRganHxb4ZhHvmP2ZSBLexLVdhGOTtwyq2YOob/Ys+2Y3
 99qbAX+100JZTJLnbjqcT7c0KMY8z+TSUtcvtwfLakLXZiURuznFeuxugTE/Ap0tmupr
 I8WXDKG+c499PBZRhjfm+jTHdipQmt4dqRhvAxAieoXVhUoSyDMAS4HIZGCoq67mfdhp
 UzHbqgIcyBdEhC4wmC4M2HlSuVvHOYS0y9LYtjwjG8akgcvZMSnTE00pCFDeAii7jKod
 4PfA==
X-Forwarded-Encrypted: i=1;
 AFNElJ85JRrgjVU+RENvurIXX5GhLePPaiq6OwPJC9DkSoiyvfbNNK26OfA6hdI05K4B4wS4BFKJCJ76P7U=@nongnu.org
X-Gm-Message-State: AOJu0YycQs66Nqr+I17rXRZubP9/tJMq7nGSa9wEJ9aoCfrlg+WgJkJQ
 8Ad6WG8OjSjyBLjo9yEn4RTfELpNoQ+nBW17ZD/9aKJ07OqY0/DP6bmEnYoMJTt1OBbcPa4iBwB
 uvjrQNHpqZX0S+Pl4WoOArQf7RDZQ9kJaspa9ZPAzhrYPXSihNDdh0AU5
X-Gm-Gg: AfdE7clYIT17EAEEuAoZPg2dm36ayd7LCE70q2A040F/W9gxrcW7ld6kG71eVflK1a5
 QAEWBHAVooCcartnhLcDaMc4GpC3stX4pYGyTIeHHcklsaiiTTaHYtKWJUxbIVpH7KNgITdAHca
 uHMzPUAFBTyo5pDP0t89qb3G4eNIY40NBLdvCZGFbALMZapK4OvKabpc+GfOIRpi18m/BAKf+0o
 L3S3pD8vABgpmz3hdppl00akZQOdtFCXwf3OaYKh9WUOOzxVLNLUIJ4vQ10V0Ua2veuNUU8214u
 eNvBl218jH1E+WME/YLEs4af/KixwnWJa0dgWqwd5OqqLyBGzLrGVBTAWfyHD7EJnMMkwLF0XHf
 g8ldVzGjPJTNXtkGh1sKXq85ayAmFA5sJJGd6hIzgxOFdxGCo+Y2oR3O6LIQiAg==
X-Received: by 2002:a05:620a:6493:b0:912:1:b41c with SMTP id
 af79cd13be357-9208c333b49mr124658985a.0.1781815897608; 
 Thu, 18 Jun 2026 13:51:37 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:912:1:b41c with SMTP id
 af79cd13be357-9208c333b49mr124652985a.0.1781815897052; 
 Thu, 18 Jun 2026 13:51:37 -0700 (PDT)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fcb6db0sm11380765e9.0.2026.06.18.13.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 13:51:36 -0700 (PDT)
Message-ID: <8a5fdcc5-c6d1-4baf-8ed6-940006a20a86@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] system/memory: split RamDiscardManager into
 source and manager
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-rust@nongnu.org, Alex Williamson <alex@shazbot.org>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Fabiano Rosas <farosas@suse.de>, Mark Kanda <mark.kanda@oracle.com>,
 Ben Chaney <bchaney@akamai.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20260604-rdm5-v5-0-5768e6a0943d@redhat.com>
 <20260604-rdm5-v5-1-5768e6a0943d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260604-rdm5-v5-1-5768e6a0943d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aOfbTJq3VAV3craK1Dbz621Mex-qPdWw
X-Proofpoint-ORIG-GUID: aOfbTJq3VAV3craK1Dbz621Mex-qPdWw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE5MCBTYWx0ZWRfXyEQxhVLyrKfd
 PevVavC2+fBCN3kNknt/azOfwK9It472lhNpviaB4cJnnebYmNnJz1teMnTTJoCkqxM2S23YgAD
 lOMtCYay79J8y9OAu2aKiNZcHu7498Lb2sdalihUhIqXUUx4s3Q5lLEufK4pTQLy34JRRri3HYd
 g6RrFzC4VOVy3AYBz7yG9Bm7XsNy0nSdG6AWKbR1AbqBwk0VinW2lZ/Yln19wWx4GMN0gIpImac
 VSbWzZV3rT1F7WWfAaKmLKzhakAw6vZPZv3fypafZYyQfegBKcaDfP1xyc+BIrnEaypZ1xZGvld
 60OsYkIBRHgOmSHp8uvAcRoTZVqAv/sBKuirW5U/0fXd74sblothQ94jgAwBfgO8wmB1n0icgI3
 /zWU/aabTNwPkPJLhn11zMciO2lsBrXPI49BAJldZmwpOmkBlDmALd3bXzpgiRwYELIMZrO55Ef
 dsi9P8DJqrlRCpMgfPw==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a345a5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A-yEnD0DAcmAWPwwjsgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE5MCBTYWx0ZWRfX0DGzMvUcJ8aH
 7yc0oNcwAoocG4qFlMs3vOOAB8ew7k5nwQNeId2qJuqZWQvndmtYXe62OS0KreZTG6W1qXp8mXM
 HyjeN36fbaRRRihYBysIOf6tnPfzvLQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180190
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
> Refactor the RamDiscardManager interface into two distinct components:
> - RamDiscardSource: An interface that state providers (virtio-mem,
>    RamBlockAttributes) implement to provide discard state information
>    (granularity, populated/discarded ranges, replay callbacks).
> - RamDiscardManager: A concrete QOM object that wraps a source, owns
>    the listener list, and handles listener registration/unregistration
>    and notifications.
> 
> This separation moves the listener management logic from individual
> source implementations into the central RamDiscardManager, reducing
> code duplication between virtio-mem and RamBlockAttributes.
> 
> The change prepares for future work where a RamDiscardManager could
> aggregate multiple sources.
> 
> Note, the original virtio-mem code had conditions before discard:
>    if (vmem->size) {
>        rdl->notify_discard(rdl, rdl->section);
>    }
> however, the new code calls discard unconditionally. This is considered
> safe, since the populate/discard of sections are already asymmetrical
> (unplug & unregister all listener section unconditionally).
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Acked-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/hw/virtio/virtio-mem.h |   3 -
>   include/system/memory.h        | 197 +++++++++++++++++++++----------------
>   include/system/ramblock.h      |   2 -
>   hw/virtio/virtio-mem.c         | 163 ++++++------------------------
>   system/memory.c                | 218 ++++++++++++++++++++++++++++++++++++-----
>   system/ram-block-attributes.c  | 171 ++++++++++----------------------
>   6 files changed, 385 insertions(+), 369 deletions(-)


> +int ram_discard_manager_notify_populate(RamDiscardManager *rdm,
> +                                        uint64_t offset, uint64_t size)
> +{
> +    RamDiscardListener *rdl, *rdl2;
> +    int ret = 0;
> +
> +    QLIST_FOREACH(rdl, &rdm->rdl_list, next) {
> +        MemoryRegionSection tmp = *rdl->section;
> +
> +        if (!memory_region_section_intersect_range(&tmp, offset, size)) {
> +            continue;
> +        }
> +        ret = rdl->notify_populate(rdl, &tmp);
> +        if (ret) {
> +            break;
> +        }
> +    }
> +
> +    if (ret) {

(Pre-existing, reduce scope?)

            RamDiscardListener *rdl2;

> +        /* Notify all already-notified listeners about discard. */
> +        QLIST_FOREACH(rdl2, &rdm->rdl_list, next) {
> +            MemoryRegionSection tmp = *rdl2->section;
> +
> +            if (rdl2 == rdl) {
> +                break;
> +            }
> +            if (!memory_region_section_intersect_range(&tmp, offset, size)) {
> +                continue;
> +            }
> +            rdl2->notify_discard(rdl2, &tmp);
> +        }
> +    }
> +    return ret;
> +}


>   void ram_discard_manager_register_listener(RamDiscardManager *rdm,
>                                              RamDiscardListener *rdl,
>                                              MemoryRegionSection *section)
>   {
> -    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
> +    int ret;
> +
> +    g_assert(section->mr == rdm->mr);
> +
> +    rdl->section = memory_region_section_new_copy(section);
> +    QLIST_INSERT_HEAD(&rdm->rdl_list, rdl, next);
>   
> -    g_assert(rdmc->register_listener);
> -    rdmc->register_listener(rdm, rdl, section);
> +    ret = ram_discard_source_replay_populated(rdm->rds, rdl->section,
> +                                              rdm_populate_cb, rdl);
> +    if (ret) {
> +        error_report("%s: Replaying populated ranges failed: %s", __func__,
> +                     strerror(-ret));

Pre-existing, should ram_discard_manager_register_listener propagate
Error*? For example the current caller provides an errp
(vfio_ram_discard_register_listener). Can be improved on top of course.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +    }
>   }



