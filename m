Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86C6EA4FD8
	for <qemu-rust@archiver.kernel.org>; Mon, 23 Feb 2026 15:54:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vuYGS-0006EK-89; Mon, 23 Feb 2026 10:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vuYGQ-0006E1-UR
 for qemu-rust@nongnu.org; Mon, 23 Feb 2026 10:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vuYGN-0002cw-04
 for qemu-rust@nongnu.org; Mon, 23 Feb 2026 10:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771862059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOuEBKX3RiEasYRIBw0IkcZmtR/BlQwl99CWe3Y4y94=;
 b=B5XcoRbZQwPLii7ENtAujlsR5qo6cLWBNJoAT12UO+O1tZSHLSuokR7W/3IPXm3qbr/AR3
 P35bU9SKIg4cMgZWMZq0YK9rqWBbZxC+Rk34ZvbYTb1uudgOTk6KAQ36sy6dIRNUJlVHYW
 5ZOqlku+P6wcXeyjQfu/YklhmAxc3w8=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-JYZeD8qSP5K9PohBvjEpCw-1; Mon, 23 Feb 2026 10:54:17 -0500
X-MC-Unique: JYZeD8qSP5K9PohBvjEpCw-1
X-Mimecast-MFC-AGG-ID: JYZeD8qSP5K9PohBvjEpCw_1771862056
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2bd808454d6so13315892eec.1
 for <qemu-rust@nongnu.org>; Mon, 23 Feb 2026 07:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771862056; x=1772466856;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NOuEBKX3RiEasYRIBw0IkcZmtR/BlQwl99CWe3Y4y94=;
 b=JPjBt8cogQnhp24B9RO0M/wKF83ulYGQEv1Iq4zCMii6nfZxsf6IkXb71PtpLRXiGx
 8T4Ax7aZ2yYUR6xHuRLdPvyP41shTVIqjxLh2YpWVmyoqlIxEkam7iRuFQZEWvN74KFp
 UN9vA3n1zBUM2hrlr2fOlu+eBgFYM+syJdv4+XuFJAnGdD4mN5Cd8ycZuPFlvYlAXUTz
 vYRPDSVPDH6PscLCBJuKqkkf6vrUg9gikf7xLpVc8Ji1ISqqgQwN9Lu1peY6PV0mlyIG
 Rrz8A510PDCNEB3ZrwXFSUPg+Gd2WbFpvOVoGD7iUdJSOpaTSTFW+LUnxSp1VwDrXXae
 o5sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnGe07VS2ccQemwsPvGWOXcPXszV5NQYRKZqOz4ZaUpkVv+SvIzgpSTk3wv7CB6b0K+mUJJ/JIN9o=@nongnu.org
X-Gm-Message-State: AOJu0Yzat64IZc0FDycY0d57lAHiD6UeGEsCF1rtjVUIUyVCDijOoO0y
 HG+G3IXMJVbvBwZSrZIn16mo5G2dYgLnbapFbjSJSPDPl5CLXiWbw0BxP/FtNHWhe56+xjK2p4v
 HkybCVk/87mohxi3QiJ4XtYugDCTDbnjgpdLoZ1ntKND+Buk8kfevOXo=
X-Gm-Gg: ATEYQzwM02++5XKqMuEZ86yFMZ4uemHXMSmKwIN6p6A6otMCet1SHlL6kJuxai1tCDf
 AIplSr7MboAIvi8UE9rIJtN8FH4uq1HIorQXcyg6XZenPZQg3S5vX5ooAP7LTkHBXBI6Aniy8H1
 gP8CeJUawYNMUwPwsl3EN6QRRZ7st0HOsbPSwVhbJ5p0DtufDO72tqX7FedHmpXt4k+lnIY2bbv
 ug5z2k5KtHVR0UeLAvrwtSph715GVlICMuMAWON08FRELj3VV0BiMKNbkircoZxaZpZb7RjkVBL
 q18M2sGW1TwLh0sVQd8gjSKgYk/oLTI6ccx5CmN+OSNxzEgP6CiOeIRboF7AmHmkSS3/o6feU81
 T891iXm/xH2g6fkMKJlwsJClP2suq9FgRFY1kcVki11NLmN9yniQc60823suUPD4btw3KvvI+70
 XRuGZR/RjnRaZ8K95UocGzZM9ab94=
X-Received: by 2002:a05:7300:7643:b0:2b8:6a22:6d52 with SMTP id
 5a478bee46e88-2bd7bd76f9emr3993329eec.33.1771862056284; 
 Mon, 23 Feb 2026 07:54:16 -0800 (PST)
X-Received: by 2002:a05:7300:7643:b0:2b8:6a22:6d52 with SMTP id
 5a478bee46e88-2bd7bd76f9emr3993312eec.33.1771862055728; 
 Mon, 23 Feb 2026 07:54:15 -0800 (PST)
Received: from [192.168.10.48] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-2bd7dc167b2sm4984731eec.28.2026.02.23.07.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 07:54:14 -0800 (PST)
Message-ID: <bedbf511-c46a-4468-bf65-cc452c621765@redhat.com>
Date: Mon, 23 Feb 2026 16:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] rust: QObject and QAPI bindings
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <aZwjpfu-qCCSoHdx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <aZwjpfu-qCCSoHdx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W4NvnJHaTflrhtQqSbltvg1K5sWfLgE-PO6ulapzrq4_1771862056
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1.179, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
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

On 2/23/26 10:53, Daniel P. Berrangé wrote:
> On Thu, Jan 08, 2026 at 02:10:27PM +0100, Paolo Bonzini wrote:
>> This adds two related parts of the Rust bindings:
>>
>> - QAPI code generator that creates Rust structs from the JSON
>>    description.  The structs are *not* ABI compatible with the
>>    C ones, instead they use native Rust data types.
>>
>> - QObject bindings and (de)serialization support, which can be used to
>>    convert QObjects to and from QAPI structs.
>>
>> Unfortunately Rust code is not able to use visitors, other than by
>> creating an intermediate QObject.  This is because of the different
>> architecture of serde vs. QAPI visitors, and because visitor's
>> dual-purpose functions, where the same function is used by both input and
>> output visitors, rely heavily on the structs using the same representation
>> as the visitor arguments (for example NUL-terminated strings).
>>
>> The serde format implementation was co-authored by me and Marc-André.
>> Marc-André did all the bug fixing and integration testing.
>>
>> As an example of how this would be used, the marshaling functions for
>> QMP commands would look like this:
> 
> Can you give more of the big picture about what follows this ?  From
> this example you're showing, are you suggesting that you'll be soon
> moving QMP command impls from C to Rust ?

The reasons for Marc-André and I to do this was just as an exploration. 
The patches show a different way to do what he had already tackled in 
2022, and allow a direct comparison the relative benefits between a more 
Rust-focused approach and a more direct translation of QEMU's C code.

Marc-André indeed had command implementations in Rust and that would be 
an obvious next step to continue on the QAPI side.  On the other hand, 
the QObject part (without QAPI structs) also works as a step towards 
more QOM integration, especially with respect to properties and 
backends.  Having a full-blown QObject implementation to move around 
bools is perhaps over-engineered, but is also an easy way to make a 
generic implementation that works for all QAPI types.

The block layer also needs QAPI for option parsing, so Kevin's work on 
block layer bindings would also benefit from having this integration.

In other words, there is no real big picture from me other than "someone 
needs to do the hard part for others": QOM, QAPI and the build system 
are the three central components from which all other bindings branch 
out.  Zhao and Marc-André have helped a lot with this work, and they 
also showed how to use these hard parts (see Zhao's vm-memory work and 
Marc-André's GStreamer backend), now it's also time for others to try 
and to take inspiration from Rust for improving the C side of things.

Paolo

> 
>>
>> fn qmp_marshal_query_stats(args: *mut QDict,
>>      retp: *mut *mut QObject, errp: *mut *mut Error)
>> {
>>      let qobj = unsafe { QObject::cloned_from_raw(args.cast()) };
>>
>>      let result = from_qobject::<StatsFilter>(qobj)
>>           .map_err(anyhow::Error::from)
>>           .and_then(qmp_query_stats)
>>           .and_then(|ret| to_qobject::<Vec<StatsResult>>(ret).map_err(anyhow::Error::from));
>>
>>      match qmp_marshal_query_stats_rs(qobj) {
>>          Ok(ret) => unsafe { *retp = ret.into_raw(); },
>>          Err(e) => unsafe { crate::Error::from(e).propagate(errp) },
>>      }
>> }
>>
> 
> With regards,
> Daniel


