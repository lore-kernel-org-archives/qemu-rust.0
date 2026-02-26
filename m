Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6871FFCE08C
	for <qemu-rust@archiver.kernel.org>; Thu, 26 Feb 2026 14:12:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vvc6c-0000bm-Aj; Thu, 26 Feb 2026 09:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vvc6P-0000No-4h
 for qemu-rust@nongnu.org; Thu, 26 Feb 2026 09:12:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vvc6N-0008GV-Ef
 for qemu-rust@nongnu.org; Thu, 26 Feb 2026 09:12:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772115145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMdmJhn6ajjCgiilfFe8zLD7EDRXhtkginMPJZv1sdM=;
 b=MuWddf4fn01ArUnfWBRMemA7znhnH0XO4kU9uWwXBex/R1gMimvl+Z+KZ3m7GgogxBumCi
 6F9jZucOz+RDlf6OLiUcypkY1Ok8pEmxVV5kXrMbILc2fGh2Xxe9JJjIyTE+8Gky2cwMH0
 bBa6lt9gyHDVknH2/HOMR1ECoMpuVrg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-742d5xdCN_G6g8L75ekbNQ-1; Thu, 26 Feb 2026 09:12:23 -0500
X-MC-Unique: 742d5xdCN_G6g8L75ekbNQ-1
X-Mimecast-MFC-AGG-ID: 742d5xdCN_G6g8L75ekbNQ_1772115143
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b934e87b1b2so92680666b.0
 for <qemu-rust@nongnu.org>; Thu, 26 Feb 2026 06:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772115142; x=1772719942;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZMdmJhn6ajjCgiilfFe8zLD7EDRXhtkginMPJZv1sdM=;
 b=riqPvMQVo4lJVjSVAh5J1j/soUi6da0hxzQSQFWVMAf4b5v/AL0gF50fiW6OGZcRHz
 75gS9l/5ylM+Gto8w1wzPq4r2fv4AvN8OAhs5zBjIOCAelg0R1wjVsJ/3+yjIo14f4RV
 XpJhhLVKS3ZdnGpHc5kogSGqnMUpwgF69X1HEvN3T9tgwwNBqMnqhjKeOnLiXi19lKZv
 NTfH26L4EwGU2RqAcX0hbt06JX/Ql81Un6ig22druO20rlNDfShkr+LxRsw7nKPKX1m5
 GXJtWHdYF5HgRPtTe9yBKV6qUjwXrr+r1zFofheGnwovk2Fg0gVP4OgJWEbs6+XW1Wfm
 6DYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgBb6x1euAl2Wgc8w0uu+vh2GCw3gW56RKpHz4EnY2H5D2tq6E4iXPoCP0Uh3SmvIGW5U3LqDYlxY=@nongnu.org
X-Gm-Message-State: AOJu0YzTAiOcEhKhJyC3HCPBVp5LV0xcoK4msPg3ZjxD6FAT/MoKNAil
 4pwZDKSxOh/Iu1VXrX9mGWucUheKJkbnP9PquIXzo6jtrrBjyL6yQqHxgEl9X8L6BI8W94GCHQ2
 pcbyYcT3UgqepFmzczwgvN2hxeUGI5XP6IHatOGLpr3/9dqaCB7gCgro=
X-Gm-Gg: ATEYQzzEcvpv3khKch5FVc35XLKDvFOGGv0Bi7wvvPy13UqxNlu1jEQZG+2++J9I4lC
 ZrTTjhzfAxknqlOgf55o5Yrxecgie59E4Eq1mwVX3SLX/EWkcHN9TLdTsYDObx6r8LfoasYarG8
 x1A2XxL7qXY/An/sr0yAIyFb4jQ5/bFuzbYJhBvkP68P+vY7igy/0/UJMtvs4DGov6DsV2Mpck+
 6kO7IhV+u84BlyvcUBswY6gZ8vy+gTbcsd3HdJw+cZC/mi+0jY+kuNOHxrrnw7Mn4tfNd+S3wiU
 /Jd2WTCFtWtElXBWB6AppnyKvyQloQVsAWNra+MTijV7sXaRsfvAevIhuKEq5bqUJI+pnJ2wrj9
 +SezVf/ImWmcmP3bx4Lqx2ZJ/ortcIlKboUldQTr1V7kwKibVU4gfIea6z6wFCXelYrszXDUiUx
 a08LE9wooit7B90w/I+5OdxGa20Ak=
X-Received: by 2002:a17:907:3fa5:b0:b8f:b3c4:1e2 with SMTP id
 a640c23a62f3a-b9351723e7cmr261607566b.39.1772115142525; 
 Thu, 26 Feb 2026 06:12:22 -0800 (PST)
X-Received: by 2002:a17:907:3fa5:b0:b8f:b3c4:1e2 with SMTP id
 a640c23a62f3a-b9351723e7cmr261606366b.39.1772115142075; 
 Thu, 26 Feb 2026 06:12:22 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b935ab13558sm65381366b.5.2026.02.26.06.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 06:12:21 -0800 (PST)
Message-ID: <2f9d77b5-7724-4c8d-9f6d-ce82815b8501@redhat.com>
Date: Thu, 26 Feb 2026 15:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] scripts/qapi: add QAPISchemaType.is_predefined
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-11-pbonzini@redhat.com> <87bjhdxooi.fsf@pond.sub.org>
 <21b5e0ec-d03d-4e39-a3bf-deada48243b7@redhat.com>
 <87ldghw6tn.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ldghw6tn.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bqaGzcFjOYs10HeAAqcwEVDB7qEIXbpkB7peJ3t9Mds_1772115143
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.306, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.668,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/25/26 09:44, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 2/25/26 08:33, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> It is impossible to call is_implicit on an enum type from the visitor, because
>>>> the QAPISchemaEnumType has already been exploded into its costituent fields.
>>>
>>> constituent
>>>
>>> Passing selected attributes instead of the entire object to its visitor
>>> method limits what the visitor can do.  This is both good and bad.
>>> We've run into "bad" a couple of times.  It's never been bad enough to
>>> change the interface, though.
>>>
>>> Thoughts?
>>
>> I think that applies here, is_predefined() is a reasonable addition.
>>
>>>> The Rust backend is also not modular (yet?) so it is not possible to filter
>>>> out the builtin module;
>>>
>>> Really?
>>>
>>> The visitors are all based on QAPISchemaVisitor.  Protocol:
>>>
>>>       .visit_begin()
>>>       for all modules:
>>>           .visit_module()
>>>           for all entities:
>>>               if .visit_needed():
>>>                   .visit_FOO()
>>>       .visit_end()
>>>
>>> QAPISchemaModularCVisitor implements .visit_module() to generate code
>>> per module.  Its .write() skips builtin modules unless opt_builtins.
>>
>> ... because its .write() already builds multiple QAPIGen{C,H,Trace}, one
>> per module.  Here instead there is just one QAPIGenRs.
>>
>> Using multiple QAPIGenRs instances, one per module, would be hackish.
> 
> I was thinking of having .visit_module() save .is_builtin_module(name)
> in self.in_builtin_module, then use that to recognize built-ins.
> 
>> I'd rather just go modular instead of that.  I can take a look, since
>> this series will be (early) 11.1 material anyway.
> 
> Modular C code generation reduces incremental build time massively.
> Before, we suffered from "touch the schema, recompile the world".  If
> Rust would similarly profit, then I'm all for going modular.

Rust compiles by crate rather than file (crate == toplevel module), so 
it would need some benchmarking but yeah I expect that to help.  That 
would mean something like

     use qapi_block::*;

Paolo


